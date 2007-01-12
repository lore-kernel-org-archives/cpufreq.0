From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: cpufreq doesn't recognise my pentium m
Date: Fri, 12 Jan 2007 07:37:48 -0500
Message-ID: <20070112123748.GF13024@dominikbrodowski.de>
References: <20070106181953.GA268358@syrinx.mpch-mainz.mpg.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20070106181953.GA268358@syrinx.mpch-mainz.mpg.de>
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
To: Tim Butler <tmb@mpch-mainz.mpg.de>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sat, Jan 06, 2007 at 07:19:53PM +0100, Tim Butler wrote:
> I recently ran into some trouble with CPU frequency scaling on my sony
> vaio laptop. I'm running a fresh install of debian etch with a custom
> kernel compiled from the latest 2.6.18 debian kernel sources, with:
> 
> CONFIG_X86_SPEEDSTEP_CENTRINO=y
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y

Does CONFIG_X86_ACPI_CPUFREQ work? Also, you might have more luck with a
more recent kernel...

	Dominik
