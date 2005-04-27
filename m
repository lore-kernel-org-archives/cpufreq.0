From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 16:07:11 +0200
Message-ID: <20050427140711.GA2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<46736.141.228.156.225.1114600117.squirrel@www.difo.com>
	<426F85F5.7010700@alumni.clemson.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <426F85F5.7010700@alumni.clemson.edu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Cc: cpufreq@lists.linux.org.uk

On Wed, Apr 27, 2005 at 08:30:45AM -0400, Mark Bidewell wrote:
> You are correct, The primary differences are that
> 1)  the clock modulation only cuts in after dangerous temperatures have 
> been detected.  This code prevents those high temperatures.
> 2)  This code uses the OS Scheduler to make targeted performance cuts on 
> certain applications.  This reduces the performance impact of throttling 
> to non-interactive processes.

I disagree.  If processors are under an overheat situation, we should
not consider performance anymore.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
