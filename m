From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 19:45:17 +0200
Message-ID: <20050427174517.GD2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
	<20050427105350.GX2298@poupinou.org>
	<426F84A8.7040000@alumni.clemson.edu>
	<20050427135402.GZ2298@poupinou.org>
	<426FB97D.3040701@alumni.clemson.edu>
	<20050427170314.GB2298@poupinou.org>
	<37485.130.127.49.120.1114622384.squirrel@130.127.49.120>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <37485.130.127.49.120.1114622384.squirrel@130.127.49.120>
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

On Wed, Apr 27, 2005 at 01:19:44PM -0400, Mark Bidewell wrote:
> I was not aware of this.  However, when I cat
> /proc/acpi/thermal_zone/THM/cooling_mode  I get:
> 
> <setting not supported>
> cooling mode:   critical
> 
> Does the Processor P-States driver need to be installed?

No.  It should work with cpufreq and then acpi_throttle.  The processor
P-state driver is just another cpufreq driver and is not required.

The bios writer do not defined enough objects under the
thermal zone (in the DSDT), and then ACPI report that
'passive cooling' is not available :(

> One distinction between my code and the ACPI code would appear to be that
> tempscale only throttles non-interactive processes as opposed to a global
> cutback.

That what I begin to understand.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
