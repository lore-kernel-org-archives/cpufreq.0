From: Thomas Renninger <trenn@suse.de>
Subject: RE: Frequency can't switch on a dual Turion 64
Date: Sat, 13 Jan 2007 21:21:48 +0100
Message-ID: <1168719708.14230.78.camel@sublime.site>
References: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>
	<1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: davej@codemonkey.org.uk, Romain =?ISO-8859-1?Q?Li=E9vin?= <roms@lievin.net>, cpufreq@lists.linux.org.uk

On Fri, 2007-01-12 at 09:06 -0600, Langsdorf, Mark wrote:
> > I may have detected a bug with the K8 cpu frequency driver
> > (powernow_k8.c). While the driver correctly
> > detect the 2 availables frequencies (800 & 1600 MHz), the 
> > governor always uses the lowest one.
> 
> It looks like the powernow-k8 driver correctly constructs
> a two entry frequency table and verifies it, and then
> reverifies a second frequency table with only 1 entry in
> it.
> 
> I'm not familiar enough with the cpufreq code to guess
> why this is happening.  I don't think it's a powernow-k8
> bug, but I suppose it could be doing something wrong.

I also think this is ACPI triggered...
does:
echo 1600000 > /sys/devices/../scaling_max_freq
helps, maybe shortly?

Is this an HP laptop?
Do you have some extended powernow/cpufreq configs in BIOS?

Is it getting too hot?
Check whether there exists a passive trip point in:
/proc/acpi/thermal_zone/*/trip_points
and whether
/proc/acpi/thermal_zone/*/temperature exceeds it.

    Thomas
