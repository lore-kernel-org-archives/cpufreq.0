From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: overclocking?
Date: 30 Jun 2003 00:24:49 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056925488.32576.100.camel@gaston>
References: <20030629114243.31cd609f.rees_b@bigpond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030629114243.31cd609f.rees_b@bigpond.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Rees Boffey <rees_b@bigpond.com>
Cc: cpufreq@lists.arm.linux.org.uk

On Sun, 2003-06-29 at 05:42, Rees Boffey wrote:
> in the cpufreq documenatation in my 2.4.21-benh kernel it mentions that
> arguments echoed to the /proc/cpufreq entry are first validated before any
> changes are made. my question is, is it possible to remove this validatio
> to allow the overclocking of the cpu?
> the ibook2.2 that i use is possible of being overclocked via software using
> an early version of the CHUD tools for osx but as of yet i have not found a
> way to do it under linux.
> appreciate any replies/flames :)

Well... some PowerMac models support only dual speeds (via PMU changing the
PLL strapping & resetting the CPU). Some others (the 750FX based iBooks)
could in theory be programmed to any speed supported by the PLL... Currently,
I do not have code to take advantage of this "feature". Those chips have 2
PLLs and can switch instantly between them. One is setup for full speed,
the other for "low speed" by the firmware, all I support via cpufreq so far
is to switch between those 2

Ben.
