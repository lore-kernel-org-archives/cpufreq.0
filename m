From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: speedstep-centrino not working with Intel Pentium M 1.73
Date: Mon, 2 Oct 2006 19:32:26 -0400
Message-ID: <20061002233226.GF9748@dominikbrodowski.de>
References: <op.telgsuax8oynmf@mthef.bredband.comhem.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <op.telgsuax8oynmf@mthef.bredband.comhem.se>
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
To: Martin Forsgren <mk0foma@student.chalmers.se>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sun, Aug 20, 2006 at 08:11:08PM +0200, Martin Forsgren wrote:
> I can run "p4-clockmode" but then I only get maximum 1.3GHz.
> None of the other cpufreq variants work.
> 
> Found a patch for 'dothan'-processors but I don't know
> wich one that is, or if I can use it on my cpu.
> http://stefans.datenbruch.de/acerTM292/

No, better not use that one.

Does "modprobe acpi-cpufreq" on a _recent_ kernel (-mm is fine)
help?

Thanks,
	Dominik
