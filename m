From: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 08:30:45 -0400
Message-ID: <426F85F5.7010700@alumni.clemson.edu>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<46736.141.228.156.225.1114600117.squirrel@www.difo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <46736.141.228.156.225.1114600117.squirrel@www.difo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ivor@ivor.org
Cc: cpufreq@lists.linux.org.uk

You are correct, The primary differences are that
1)  the clock modulation only cuts in after dangerous temperatures have 
been detected.  This code prevents those high temperatures.
2)  This code uses the OS Scheduler to make targeted performance cuts on 
certain applications.  This reduces the performance impact of throttling 
to non-interactive processes.

>I think the idea is to reduce cpuspeed, with the intention of having the side
>effect of reducing temperature. Rather than to throttle based on temperature
>(I may be wrong). I believe P4's will throttle themselves automatically when
>they get too hot anyway.
>
>Cheers,
>Ivor.
>
>
>
>  
>
