From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 19:03:14 +0200
Message-ID: <20050427170314.GB2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<426F84A8.7040000@alumni.clemson.edu>
	<20050427135402.GZ2298@poupinou.org>
	<426FB97D.3040701@alumni.clemson.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <426FB97D.3040701@alumni.clemson.edu>
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

On Wed, Apr 27, 2005 at 12:10:37PM -0400, Mark Bidewell wrote:
> Bruno Ducrot wrote:
> 
> >On Wed, Apr 27, 2005 at 08:25:12AM -0400, Mark Bidewell wrote:
> > 
> >
> >>Thank you very much for your imput.  I will make those adjustments in 
> >>the next patch.  The temperature was obtained by reading 
> >>/proc/acpi/thermal_zone/THM/temperature  for a usermode daemon. 
> >>
> >>   
> >>
> >
> >You mean you cant use ACPI thermal stuff in order to get it right?
> >
> > 
> >
> 
> If I understand your question right, I have looked into this.  The 
> functions which extract the raw temperature data use ACPI control 
> structures which appear to be created automagically as part of the file 
> open process.  I have not been able to determine were they are created and 
> so have not been able to call them directly (I am no expert on this by any 
> means so I could be totally off base here).  This would leave opening the 
> /proc file inside the kernel as the only other option and I am not sure 
> that making those kind of calls from kernel mode would be a good idea.

ACPI define two modes for cooling a processor.  By default, active
mode will be used.  You have to enable passive mode via
/proc/acpi/thermal/*/cooling_mode and you may have to define a polling
frequency via /proc/acpi/thermal/*/polling_frequency.  If also the
cpufreq infrastructure is working, the ACPI thermal subsystem will
change automagically
/sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
based upon the temperature of the processor attached to that thermal
zone.

Actually this may not work on certain situation.
This was just a single question.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
