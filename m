From: Chris Freyer <chris@thefreyers.net>
Subject: Re: Repost:  System freeze running powersaved.
Date: Fri, 07 Jan 2005 00:29:55 -0500
Message-ID: <6.2.0.14.0.20050106235406.02a67fc0@mail.thefreyers.net>
References: <E1CmKfa-000Jhs-Bt@server2.anyname.com>
	<20050106104216.GA4336@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20050106104216.GA4336@inferi.kami.home>
References: <E1CmKfa-000Jhs-Bt@server2.anyname.com>
	<20050106104216.GA4336@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

At 05:42 AM 1/6/2005, you wrote:
> > FYI:  I have a VIA C3 processor, VIA chipset, and VIA video.  Similar
> > in function to a VIA EPIA motherboard, but made by Matsonic.
>
>You might be interested in this thread[1] then, it seems the problem you
>reported is similar.
>
>[1]:
>http://www.linux.org.uk/mailman/private/cpufreq/2004-December/004763.html

Thanks for the URL.  It started me down the right path.  Believe it or not, 
the problem was solved by building the kernel from the original SuSE 
sources.  Maybe the kernel (which had been updated by Suse online update) 
was out of synch with the modules (??).  Don't know for sure.  But 
powersaved is working now.

And if it helps anyone, I wrote a script to output the CPU speed every 
second or more.  Have fun with it.

Thanks!!
Chris


#! /bin/bash
# 2004/01/07
# output cpu speed every second or so until terminated.

while [ true ]; do
         powersave -r

         #use this line instead if you don't have powersave
         #grep MHz /proc/cpuinfo | cut -d: -f2

         sleep 1
done
