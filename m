From: Ducrot Bruno <ducrot@poupinou.org>
Subject: [RFC] cpufreq_get()
Date: Thu, 22 Jan 2004 20:06:49 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040122190649.GC25416@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I'm planing to add the cpufreq_get() in struct cpufreq_driver,
but in a hardware fashion, eventually replacing the name by
something more appropriate.

Rational:
- almost all drivers that I know (powernow-k7, speedstep-*,
  longrun, and Im looking the PPC version) can implement it,
  the only one that I am aware for which it is not possible is
  the ACPI performance IO driver.

- by accessing driver->cpufreq_get() via a sysfs, we can verify if
  the 3 mains governors works.  Even for longrun, we
  can verify that the frequency is between min and max.

- we can compare /proc/cpuinfo with the result of cpufreq_get(),
  helping in debugging things.

- people may want to monitor the real frequency in their applet,
  so this help for having a more consistent API (google for 
  wmlongrun, for example).

- It is required for the ARM architecture anyway.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
