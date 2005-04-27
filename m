From: "Mark Bidewell" <mark.bidewell@alumni.clemson.edu>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 13:19:44 -0400 (EDT)
Message-ID: <37485.130.127.49.120.1114622384.squirrel@130.127.49.120>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<426F84A8.7040000@alumni.clemson.edu>
	<20050427135402.GZ2298@poupinou.org>
	<426FB97D.3040701@alumni.clemson.edu>
	<20050427170314.GB2298@poupinou.org>
Reply-To: mark.bidewell@alumni.clemson.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050427170314.GB2298@poupinou.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

I was not aware of this.  However, when I cat
/proc/acpi/thermal_zone/THM/cooling_mode  I get:

<setting not supported>
cooling mode:   critical

Does the Processor P-States driver need to be installed?

One distinction between my code and the ACPI code would appear to be that
tempscale only throttles non-interactive processes as opposed to a global
cutback.


> ACPI define two modes for cooling a processor.  By default, active
> mode will be used.  You have to enable passive mode via
> /proc/acpi/thermal/*/cooling_mode and you may have to define a polling
> frequency via /proc/acpi/thermal/*/polling_frequency.  If also the
> cpufreq infrastructure is working, the ACPI thermal subsystem will
> change automagically
> /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
> based upon the temperature of the processor attached to that thermal
> zone.
>
> Actually this may not work on certain situation.
> This was just a single question.
>
> --
> Bruno Ducrot
>
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.
>
