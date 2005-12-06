From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: why does speedstep_detect_processor() return failure?
Date: Tue, 6 Dec 2005 07:19:58 +0100
Message-ID: <20051206061958.GA9906@isilmar.linta.de>
References: <8dff05a00511291916h39427e1fsff55e81e3a843b21@mail.gmail.com>
	<20051204165751.GC8422@isilmar.linta.de>
	<8dff05a00512041643id27fc97y7595c3dd04a3e016@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <8dff05a00512041643id27fc97y7595c3dd04a3e016@mail.gmail.com>
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
To: Rob Hess <robwhess@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sun, Dec 04, 2005 at 04:43:30PM -0800, Rob Hess wrote:
> > Please post the output of /proc/cpuinfo and of x86info

Thanks for the info.

> Extended feature flags:
>  est tm2 cntx-id
   ^^^

Then either speedstep-centrino or acpi-cpufreq are the drivers to
use, not speedstep-ich.

	Dominik
