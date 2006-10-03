From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: new p4-clockmod capable CPUs
Date: Mon, 2 Oct 2006 21:28:12 -0400
Message-ID: <20061003012812.GA10059@dominikbrodowski.de>
References: <EB12A50964762B4D8111D55B764A8454ABC291@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454ABC291@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Mon, Oct 02, 2006 at 04:23:17PM -0700, Pallipadi, Venkatesh wrote:
> >- Is the method in pentiumM_get_frequency() for these CPUs?
> May not work and will need change. The bus speed will not be 100 on all
> these CPUs..

What's the register to look at, and the values? Can't find anything in
245472-012, unfortunately, which would help me for this...

Thanks,

	Dominik
