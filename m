From: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 12:20:01 -0400
Message-ID: <426FBBB1.7000001@alumni.clemson.edu>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<46736.141.228.156.225.1114600117.squirrel@www.difo.com>
	<426F85F5.7010700@alumni.clemson.edu>
	<20050427140711.GA2298@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050427140711.GA2298@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

Bruno Ducrot wrote:

>On Wed, Apr 27, 2005 at 08:30:45AM -0400, Mark Bidewell wrote:
>  
>
>>You are correct, The primary differences are that
>>1)  the clock modulation only cuts in after dangerous temperatures have 
>>been detected.  This code prevents those high temperatures.
>>2)  This code uses the OS Scheduler to make targeted performance cuts on 
>>certain applications.  This reduces the performance impact of throttling 
>>to non-interactive processes.
>>    
>>
>
>I disagree.  If processors are under an overheat situation, we should
>not consider performance anymore.
>
>  
>
I am in agrement that performance doesn't matter in a CPU thermal 
emergency.  In fact no software throttling would be reliable enough (or 
fast enough) to prevent problems consistently.  I see this governor as a 
preventative measure to reduce day-to-day thermal stress not as an an 
emergency stopgap.  The possible advantages of the governor I see are:

1)  The higher the temperature at which a CPU runs the lower its life.  
A common rule of thumb is that increasing operating temperature by 10C 
cuts CPU life in half.  CPU throttling does not cut in until an 
emergency occurs (which can be often on a laptop).  It would be useful 
to reduce this stress
2)  Quieter operation by reducing the amount of time fans have to run.
3)  Reducing the effect of heat on other components of a system 
(particularly the hard drive in a laptop) which are near the CPU.
