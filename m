From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Powernow in kernel 2.6.6-rc5
Date: Fri, 4 Jun 2004 17:12:56 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040604151256.GA8490@dominikbrodowski.de>
References: <40C06AB2.7010407@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C06AB2.7010407@web.de>
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
Content-Transfer-Encoding: 7bit
To: Sercz <sercz@web.de>
Cc: cpufreq@www.linux.org.uk

On Fri, Jun 04, 2004 at 02:27:30PM +0200, Sercz wrote:
> Hi,
> 
> I've read your article (http://forums.gentoo.org/viewtopic.php?t=178018) 
> and did the steps you said- but it doesn't work.

Just to  clarify: this is a mailing list.

> Adding "powernow_k7.powernow_acpi_force=1" to the kernel command line 
> changes my dmesg output to:
> powernow: Minimum speed 995 MHz. Maximum speed 1393 MHz.
> powernow: Minimum speed 995 MHz. Maximum speed 1393 MHz.

> but minimum speed is, as you, see still ca. 1GHz, under win I was able 
> to clock down to 233MHz.

Probably Windows also does throttling on Athlons -- under normal
circumstances, throttling doesn't allow you to run your notebook any longer
on battery power. 233 MHz most likely isn't done by PowerNow; AFAICS
PowerNow is working fine on your system.

	Dominik
