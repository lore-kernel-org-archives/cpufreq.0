From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Cpufreq for 2.4: what is the best source?
Date: Fri, 15 Aug 2003 17:41:56 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030815154156.GA1029@brodo.de>
References: <3F3CB378.1000607@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F3CB378.1000607@basmevissen.nl>
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
Content-Transfer-Encoding: 7bit
To: Bas Mevissen <sgm@basmevissen.nl>
Cc: Cpufreq@www.linux.org.uk

On Fri, Aug 15, 2003 at 12:18:32PM +0200, Bas Mevissen wrote:
> 
> Hi all,
> 
> What is the best source for CPUFREQ for a 2.4.22-rc2 kernels? Is it the 
> 2.4.22-rc2-ac1 kernel version or the 2.4 tarballs on 
> ftp://ftp.linux.org.uk/pub/linux/cpufreq/ or the LINUX_2_4 tag from CVS?

Either 2.4.22-rc2-ac1 or the latest 2.4 backport on www.codemonkey.org.uk -
but as that's offline at the moment, I'd try -ac. Or 2.6.0-test3-bk-current
:)

> Does someone know when codemonkey comes on-line again? Or is there 
> another place where I can find up to date documentation?
IIRC there's zero extra documentation on "codemonkey.org.uk" 
The best documentation is within the linux kernel sources [2.4.-patched,
2.4-ac, or 2.6.] in Documentation/cpu-freq/

	Dominik
