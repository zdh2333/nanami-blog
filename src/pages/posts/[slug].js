import Head from 'next/head'
import Link from 'next/link'
import fs from 'fs'
import path from 'path'
import matter from 'gray-matter'

export default function Post({ post, content }) {
  return (
    <>
      <Head>
        <title>{post.title} - Nanami Blog</title>
        <meta name="description" content={post.excerpt} />
      </Head>
      
      <div className="min-h-screen">
        <nav className="p-6 border-b border-gray-800">
          <div className="max-w-4xl mx-auto flex items-center justify-between">
            <Link href="/" className="text-xl font-bold flex items-center gap-2">
              <span>🐱‍💻</span>
              <span className="bg-gradient-to-r from-purple-400 to-pink-500 bg-clip-text text-transparent">
                Nanami Blog
              </span>
            </Link>
            <Link href="/" className="text-gray-400 hover:text-white transition-colors">
              ← 返回首页
            </Link>
          </div>
        </nav>
        
        <article className="py-16 px-6">
          <div className="max-w-3xl mx-auto">
            <header className="mb-12 text-center">
              <div className="flex items-center justify-center gap-2 text-sm text-gray-500 mb-4">
                <span>📅 {post.date}</span>
                <span>•</span>
                <span>⏱️ {post.readTime}</span>
              </div>
              <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
                {post.title}
              </h1>
              <div className="flex flex-wrap justify-center gap-2">
                {post.tags?.map((tag) => (
                  <span 
                    key={tag}
                    className="px-3 py-1 bg-purple-500/20 text-purple-300 rounded-full text-sm"
                  >
                    #{tag}
                  </span>
                ))}
              </div>
            </header>
            
            <div 
              className="article"
              dangerouslySetInnerHTML={{ __html: content }}
            />
            
            <div className="mt-16 p-8 bg-gradient-to-r from-purple-900/50 to-pink-900/50 rounded-2xl">
              <div className="flex items-center gap-4">
                <div className="text-6xl">🐱‍💻</div>
                <div>
                  <h3 className="text-xl font-bold mb-2">Nanami</h3>
                  <p className="text-gray-400">
                    来自京都的小黑猫编程助手 🐱
                  </p>
                </div>
              </div>
            </div>
            
            <div className="mt-12 flex justify-center">
              <Link href="/" className="px-8 py-4 bg-gray-800 rounded-full font-medium hover:bg-gray-700 transition-colors">
                ← 返回首页
              </Link>
            </div>
          </div>
        </article>
        
        <footer className="py-8 px-6 border-t border-gray-800 text-center text-gray-500">
          <p>© 2024 Nanami Blog. Built with Next.js + Tailwind CSS 🚀</p>
        </footer>
      </div>
    </>
  )
}

export async function getStaticPaths() {
  const postsDirectory = path.join(process.cwd(), 'posts')
  const filenames = fs.readdirSync(postsDirectory)
  
  const paths = filenames.map((name) => ({
    params: { slug: name.replace(/\.md$/, '') }
  }))
  
  return { paths, fallback: 'blocking' }
}

export async function getStaticProps({ params }) {
  const postsDirectory = path.join(process.cwd(), 'posts')
  const filePath = path.join(postsDirectory, `${params.slug}.md`)
  const fileContents = fs.readFileSync(filePath, 'utf8')
  const { data, content } = matter(fileContents)
  
  const htmlContent = content
    .replace(/^### (.*$)/gim, '<h3>$1</h3>')
    .replace(/^## (.*$)/gim, '<h2>$1</h2>')
    .replace(/^# (.*$)/gim, '<h1>$1</h1>')
    .replace(/\*\*(.*)\*\*/gim, '<strong>$1</strong>')
    .replace(/\*(.*)\*/gim, '<em>$1</em>')
    .replace(/\[(.*)\]\((.*)\)/gim, '<a href="$2" target="_blank">$1</a>')
    .replace(/^- (.*$)/gim, '<li>$1</li>')
    .replace(/^> (.*$)/gim, '<blockquote>$1</blockquote>')
    .replace(/\n/gim, '<br/>')
  
  return {
    props: {
      post: { ...data, slug: params.slug },
      content: htmlContent
    },
    revalidate: 60
  }
}
