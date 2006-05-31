From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: cpufreq & dual core CPUs.
Date: Wed, 31 May 2006 07:33:34 +0200
Message-ID: <20060531053334.GA11111@isilmar.linta.de>
References: <88056F38E9E48644A0F562A38C64FB60085E064C@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60085E064C@scsmsx403.amr.corp.intel.com>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

Hi,

> >That implies to me that they're separate cores no?
> 
> This implies software coordination is not happening here.
> But, that is OK, as hardware or BIOS coordination can be happening.

However, I still fail to see why hardware/BIOS coordination is in any way
better to software coordination and why we don't use software coordination
for speedstep-centrino. Especially as it can so easily lead to confusion.

	Dominik
