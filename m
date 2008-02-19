From: Wes Felter <wesley@felter.org>
Subject: Re: Intel Core2Duo mobile - how does the VID get set?
Date: Tue, 19 Feb 2008 13:12:29 -0600
Message-ID: <47BB2A1D.1090306@felter.org>
References: <47BAC961.6030808@fenrir.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <47BAC961.6030808@fenrir.org.uk>
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
To: Brian Morrison <bdm@fenrir.org.uk>
Cc: cpufreq@lists.linux.org.uk

Brian Morrison wrote:
> After a fair bit of Googling and reading around, I'm none the wiser =

> about exactly how Linux 2.6.x sets the processor VID (or for that matter =

> how it decides the FID settings) when using the ondemand governor and =

> cpufreq stuff.
> =

> Can anyone tell me a) whether this is obtained from the BIOS, something =

> in the MSR of the processor or elsewhere and b) whether there is an =

> interface in /proc or /sys where one can find out what is set and modify =

> it?

There is an ACPI table created by the BIOS that lists all the P-states; =

a P-state is a <frequency, opaque value> tuple where the opaque value =

contains the FID and VID but Intel pretends it is magic. The =

acpi-cpufreq driver reads this table and uses it to change states by =

writing the opaque value into the appropriate MSR.

The Intel 64 and IA-32 Architectures Software Developer=92s Manual, Volume =

3A, chapter 13 describes the hardware (vaguely).

If you want to see what is going on under the hood, try Linux-PHC: =

http://phc.athousandnights.de/

(Setting followup to cpufreq list.)

Wes Felter - wesley@felter.org
