From: paul.devriendt@amd.com
Subject: RE: Athlon 64 complains of frequency mismatch
Date: Mon, 21 Jun 2004 23:02:06 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8431990B9@SAUSEXMB1.amd.com>
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
To: elf@buici.com, cpufreq@www.linux.org.uk

> > Partly. It shows the values received by the powernow-k8 driver are
> > _completely_ bogus. A standard questions: have you tried a 
> BIOS update?
> 
> I looked for one.  I downloaded a BIOS, though I'm not sure it is
> newer than the one installed.  The release notes make no mention of
> powernow or acpi.

> I did fetch it.  There are no entries for _PSS or even PSS.

The frequency/voltage values are different for different processor
models. The way that this is supposed to work is that the BIOS
provides a table of the frequency/voltage data that the driver 
uses, thus making the driver independent of the platform.

Obviously if the BIOS does not do this, then the driver has no
data. I do have a version of the driver that uses hardcoded
values for my own testing purposes, but the source has to be
edited to put in the correct values for your particular processor.

I did intend to make this data module parameters, but have not
had the time to do so yet. You can find the correct data values
for your processor from the "Power and Thermal" pdfs available 
on www.amd.com. Let me know if you want a copy of this hardcoded
driver (or it is easy to modify the driver ourself).

Paul.
