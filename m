From: Alessandro Guido <alessandro.guido@gmail.com>
Subject: Re: [PATCH] Use menuconfig for CONFIG_CPU_FREQ
Date: Thu, 14 Feb 2008 00:00:52 +0100
Message-ID: <200802140000.52936.alessandro.guido@gmail.com>
References: <200802132330.23817.alessandro.guido@gmail.com>
	<20080213225058.GA20358@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080213225058.GA20358@flint.arm.linux.org.uk>
Content-Disposition: inline
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
To: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-arch@vger.kernel.org

> Doesn't this cause these CPUFREQ options to appear outside of the CPUFREQ
> menu?
> 

No because they all depend on CPU_FREQ and as far as I understand Kconfig
automagically puts them under the same menu.
