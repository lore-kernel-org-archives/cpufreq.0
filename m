From: Luciano Miguel Ferreira Rocha <strange@nsk.no-ip.org>
Subject: Re: 2.4.21 Isn't working for me....
Date: Tue, 26 Aug 2003 23:47:27 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030826224727.GA14287@nsk.no-ip.org>
References: <1061872616.27076.47.camel@localhost>
	<20030826064747.GE10585@poupinou.org>
	<1061927026.14523.9.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1061927026.14523.9.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: AthlonRob <AthlonRob@axpr.net>
Cc: cpufreq@www.linux.org.uk

On Tue, Aug 26, 2003 at 12:43:47PM -0700, AthlonRob wrote:
> On Mon, 2003-08-25 at 23:47, Ducrot Bruno wrote:
> 
> > The latest is again 2.4.22, _not_ 2.4.21.
> 
> That's the latest from the kernel.org repository, right?  the ones with
> filenames like cpufreq-LINUX_2_4-20030825.tar.gz?
> 
> The codemonkeys ones, with filenames like cpufreq-2.4.21-1.gz are
> against 2.4.21... right?  :-)
> 
> I would go ahead and just upgrade to 2.4.22, except I really need (ok, I
> don't need, I just really want) preempt, low-latency scheduling, and the
> latest NTFS drivers in this kernel... and 2.4.22 is still too new for
> any of those to be available.  :-(

On http://www.gotontheinter.net/exoops/modules/mydownloads/
there's a patch with all that, plus cpufreq (I don't know which version),
for kernel 2.4.22. Plus supermount, etc.

Actually, I don't know about the NTFS driver, but, as with everything else,
really, 2.4.22 doesn't change that much and the patches for 2.4.21 would
probably work with few rejects, correctable by hand.

I've been using that kernel, but can't get swsusp to work correctly and
cpufreq doesn't work that well with my chipset, anyhow, (it's a 440BX,)
so test it throughly.

Regards,
Luciano Rocha
