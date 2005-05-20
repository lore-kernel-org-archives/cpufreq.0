From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Centrino 1.5 in Acer Aspire 1681WLMi
Date: Fri, 20 May 2005 10:38:02 +0200
Message-ID: <20050520083802.GA598@isilmar.linta.de>
References: <4285BC64.5060800@epf.pl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4285BC64.5060800@epf.pl>
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
Content-Transfer-Encoding: 7bit
To: Jan Mazur <mazu@epf.pl>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sat, May 14, 2005 at 10:52:52AM +0200, Jan Mazur wrote:
> Hi,
> I've installed cpufreq, I'm using module acpi-cpufreq (speedstep-centrio
>  won't load for some reason) The problem is that the values in
> /sys/devices/system/cpu/cpu0/ look like they were for Centrino 1.6 (The
> max values are set to 1600000 and the available frequences are 1600000
> 1400000 120000 800000 600000) The cpufreq-info also recognise the
> processor as 1.6 Where is the problem? Can I change the settings to 1.5?

The problem is in the ACPI tables which export one frequency state as
"1600000" even though it clearly is "1500000". You'd need to fix the ACPI
table -- see http://acpi.sf.net -- or check for a BIOS update, and/or
complain at the vendor for this bug.

	Dominik
