From: Ivor Hewitt <ivor@ivor.org>
Subject: Re: Repost:  System freeze running powersaved.
Date: Fri, 7 Jan 2005 07:46:45 +0000
Message-ID: <200501070746.45424.ivor@ivor.org>
References: <E1CmKfa-000Jhs-Bt@server2.anyname.com>
	<20050106104216.GA4336@inferi.kami.home>
	<6.2.0.14.0.20050106235406.02a67fc0@mail.thefreyers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <6.2.0.14.0.20050106235406.02a67fc0@mail.thefreyers.net>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

On Friday 07 Jan 2005 05:29, Chris Freyer wrote:
>
> And if it helps anyone, I wrote a script to output the CPU speed every
> second or more.  Have fun with it.
>
> Thanks!!
> Chris
>
>
> #! /bin/bash
> # 2004/01/07
> # output cpu speed every second or so until terminated.
>
> while [ true ]; do
>          powersave -r
>
>          #use this line instead if you don't have powersave
>          #grep MHz /proc/cpuinfo | cut -d: -f2
>
>          sleep 1
> done
>

or you could just:

watch -n 1 powersave -r


-- 
Ivor Hewitt.
http://www.ivor.it - tech | http://www.ivor.org - hedge
