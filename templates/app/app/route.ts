import { NextResponse } from 'next/server';

// foo bar
 
export async function GET() { 
  return NextResponse.json({ "hello": "world" });
}
