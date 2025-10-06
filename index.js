import Head from 'next/head';
export default function Home(){
  return (
    <div style={{background:'#000', color:'#fff', minHeight:'100vh', padding:24}}>
      <Head><title>MSW Video App</title></Head>
      <h1>MSW Video App — Web</h1>
      <p>Run <code>inject_keys.sh</code> to add Firebase config, then start the app.</p>
    </div>
  );
}
