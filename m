From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at driver
	initialization
Date: Sun, 4 Dec 2005 18:00:46 +0100
Message-ID: <20051204170046.GE8422@isilmar.linta.de>
References: <11333087111183-git-send-email-malattia@linux.it>
	<438D9111.2000306@tremplin-utc.net>
	<20051130223038.GD3620@inferi.kami.home>
	<438E38B3.3080009@tremplin-utc.net>
	<20051201193147.GB4432@inferi.kami.home>
	<438F659B.3070103@tremplin-utc.net>
	<20051201233411.GA5563@inferi.kami.home> <439031F0.2090607@lifl.fr>
	<4792.83.103.117.254.1133530475.squirrel@picard.linux.it>
	<20051202205941.GE3598@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051202205941.GE3598@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Piel <Eric.Piel@lifl.fr>, Eric Piel <eric.piel@tremplin-utc.net>, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, davej@redhat.com, syrjala@sci.fi

On Fri, Dec 02, 2005 at 09:59:41PM +0100, Mattia Dongili wrote:
> the attached patch introduces runtime latency measurement for ICH[234]
> based chipsets instead of using CPUFREQ_ETERNAL. It includes
> some sanity checks in case the measured value is out of range and
> assigns a safe value of 500uSec that should still be enough on
> problematics chipsets (current testing report values ~200uSec). The
> measurement is currently done in speedstep_get_freqs in order to avoid
> further unnecessary transitions and in the hope it'll come handy for SMI
> also.
> 
> Signed-off-by: Mattia Dongili <malattia@linux.it>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>
