From: paul.devriendt@amd.com
Subject: RE: Cleanups for powernow-k8
Date: Tue, 13 Jan 2004 20:49:28 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C080EF398@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
To: pavel@ucw.cz
Cc: davej@redhat.com, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, linux@brodo.de

> I'd suggest to leave old driver there (possibly let me clean it up
> ;-)))), and create new powernow-k8-acpi, or powernow-acpi or something
> like that.
> 								Pavel

Keeping the old driver around for machines without ACPI support or with
broken ACPI support sounds reasonable to me. Please feel free to clean
it up. Feel free to send it to me if you want me to test it on additional
hardware. Dominik sent me some great patches to use the cpufreq table support 
and remove some redundant code - let me know if you do not have them and
want me to forward them. They work great.

powernow-k8-acpi sounds like a fine plan to me. Keeping the k8 in the name 
is goodness.

Dave had a good idea of a minimal ACPI parser for trying to retrieve the
table of p-states from an ACPI BIOS without needing the full AML interpreter.
I will see if I can get that to work in powernow-k8-acpi ... that way, there
is the best chance of being able to work around a broken BIOS. I hate broken
BIOSs and would rather see the BIOS vendor fix the BIOS, but that does not
always seem to happen.

Paul.
