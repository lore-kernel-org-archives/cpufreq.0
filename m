From: paul.devriendt@amd.com
Subject: RE: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 10:59:05 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C11E36B33@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: ducrot@poupinou.org, davej@redhat.com
Cc: akpm@osdl.org, linux@dominikbrodowski.de, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, pavel@ucw.cz

> But I can't say for sure which have to be favored: legacy or ACPI.
> I don't have enough dump of ACPI tables and PSB/PST from 
> machines shipped
> with AMD64.
> 
> Bruno Ducrot

ACPI please ....

1. It seems that system manufacturers are testing with Windows XP
only before shipping their machines. Windows XP uses ACPI, so that
is the mechanism that is most likely to have accurate pstate data.
2. We are seeing a lot of broken PSB/PSTs.
3. The PSB/PST does not support SMP in its current form. ACPI does.
4. Current plan is to not have PSB/PST at all for future processors.
5. You need the ACPI support for the _PPC object which gives battery
and thermal control.

The downside to making the ACPI favored is that it is newer. But,
given the PSB/PST breakages from bad BIOS data, the newer is going
to be more robust.

Paul.
