From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Help with Installation
Date: Sat, 3 Apr 2004 17:22:42 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040403172242.D5553@flint.arm.linux.org.uk>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040403171633.610cc960.frx@firenze.linux.it>;
	from frx@firenze.linux.it on Sat, Apr 03, 2004 at 05:16:33PM +0200
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
To: Francesco Poli <frx@firenze.linux.it>
Cc: cpufreq@www.linux.org.uk

On Sat, Apr 03, 2004 at 05:16:33PM +0200, Francesco Poli wrote:
> On Sat, 3 Apr 2004 16:50:45 +0200 Bruno Ducrot wrote:
> 
> > tar xzvfp cpufreq-...tar.gz
> > cd cpufreq
> > ./patchin.sh /path/to/kernel/sources
> > 
> > Do *not* remove the cpufreq directory that was unpacked.
> 
> Why did you set up such a strange procedure?
> What are the advantages over a simple patch like the old ones found in
> http://www.codemonkey.org.uk/projects/cpufreq/   ?
> 
> I'd say a gzipped (or bzip2ed) patch file would be much more easy to
> apply (especially with automatic tools such as Debian kernel-package,
> that is, make-kpkg), but of course I may be wrong...
> 
> Could you please explain the rationale behind such a choice?

We don't have the (massive) resources to be able to generate a patch
for every single kernel version which someone may want to apply the
cpufreq code to from the CVS.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
