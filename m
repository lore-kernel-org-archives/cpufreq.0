From: "Thomas Kisler" <kay@RZ.FH-Augsburg.DE>
Subject: Why supports the speedstep-ich only 2 processor states
Date: Thu, 3 Aug 2006 15:35:40 +0200 (CEST)
Message-ID: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
Reply-To: kay@RZ.FH-Augsburg.DE
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Hello everybody,

i'm wondering why the speedstep-ich cpufreq driver only supports two
processor states in general.

I own an IBM Thinkpad X24 with a 1.13 GHz Mobile Pentium 3m (Tualatin)
which runs on 1130 MHz and 733 MHz with cpufreq.

But if I select in BIOS the 'fixed slow' option at the customized Power
Mode _and_ boot a kernel without cpufreq support at all, /proc/cpuinfo
reports me the cpu running at 191 MHz. Also the acpi reports a lower
discharging rate of the battery, as if i run at 733 MHz.

So I had a look at the source code of the speedstep-ich driver and noticed
that there are only a SPEEDSTEP_HIGH and a SPEEDSTEP_LOW frequency in the
speedstep_freqs struct. Can anybody tell me why?

If there is no specific reason, has anybody information about how the
available frequencies are calculated. So i can adapt the source code that
this 3rd power state is available.

Thanks in advance.

Greetings

Thomas Kisler
