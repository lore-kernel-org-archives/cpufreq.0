From: Dominik Brodowski <linux@brodo.de>
Subject: Re: powernow-k7 (again) on 2.4.20
Date: Tue, 22 Jul 2003 13:58:00 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030722115800.GA1160@brodo.de>
References: <03072108302101.00222@gate>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <03072108302101.00222@gate>
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
To: emmel <the_emmel@gmx.net>
Cc: cpufreq@www.linux.org.uk

Hi "emmel",

This is not a cpufreq bug, but a bug in the BIOS. It reports wrong values in
the "PST" which should be dumped in "dmesg" when you load the powernow
module [or once it is started, in case you built it into the kernel]. You
might want to try up- or downgrading your BIOS or to override the BIOS
table; some patches for this are in the list archives, Dave Jones intends to
add a generic capability to override the PST to the powernow module in
future.

	Dominik

On Mon, Jul 21, 2003 at 08:30:21AM +0200, emmel wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I've posted that before, but I've serious trouble with cpufreq. It returns 
> once loaded it makes the CPU speed drop from 1.4GHz to 800MHz (666 when 
> throttled). If the kde info thingy is somewhat relyable at all that's for 
> real - the bogomips drop as well. Returning to 1.4GHz seems impossible 
> without restarting (I've tried unloading the module). Somehow cpufreq gets 
> the stupid idea that the CPU is scaleable between 500 and 600MHz which has to 
> be the reason for those odd results. We are talking about a Mobile Athlon XP 
> 1600+ here, BTW (though it's reported by linux as a 1500+). If you ask me 
> that's a serious problem. The odd thing, however, is that it didn't happen 
> with the same kernel version before. Maybe it depends on some intel code to 
> work correct (I used to have the CPU in the kernel set to PIII, now it's 
> correctly at Athlon) or maybe it has something to do with the swsp patch that 
> I *don't* have applied to my actual kernel. HELP!
> The same odd behavior(sp?) appears with clean 2.5.72 and 2.6.0-test1 kernels.
