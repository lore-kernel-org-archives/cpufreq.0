From: Dave Jones <davej@redhat.com>
Subject: Re: Core2Duo locked at 800MHz
Date: Mon, 26 Nov 2007 14:09:29 -0500
Message-ID: <20071126190929.GE15764@redhat.com>
References: <474A6C62.3070103@reinelt.co.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <474A6C62.3070103@reinelt.co.at>
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
To: Michael Reinelt <michael@reinelt.co.at>
Cc: cpufreq@lists.linux.org.uk

On Mon, Nov 26, 2007 at 06:49:06AM +0000, Michael Reinelt wrote:

 > What I found out is that the problem seems to be related to ACPI or the 
 > acpi-cpufreq module. When I boot the notebook into single-user mode 
 > (using vanilla 2.6.23 or 2.6.24-rc3), with no modules loaded, the cpu 
 > runs at 2.4GHz. As soon as I laod the acpi-cpufreq module, the upper 
 > limit falls in some steps (2 GHz, 1200MHz) to 800 MHz. Note that there 
 > is neither acpid nor any powersave daemon running!

Do you have CONFIG_CPU_FREQ_GOV_ONDEMAND enabled in your kernel ?
 
 > I tried to play with cpufreq.debug, but I don't know what all the 
 > messages are about :-(

If you had attached them, we might have had some clues.

 > I already installed the latest BIOS 1.08 from Fujitsu, but nothing changes.
 > 
 > At the moment my workaround is *not* to load acpi-cpufreq, so the CPU 
 > stays at 2.4GHz all the time, but I really want to use powersaving with 
 > the machine....

I'm confused.  It sounds like you _are_ using power saving.
The whole purpose of cpufreq is to lower the cpu speed when idle.
If you run some cpu intensive load like a big compile, does the
speed go back up ?
 
 > I'm willing to provide all necessary infos If you tell me what to to.

the cpufreq.debug=7 logs would be a good start.

	Dave

-- 
http://www.codemonkey.org.uk
