From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Fri, 24 Oct 2003 20:38:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031024183852.GE28421@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
	<20031023141703.GG643@openzaurus.ucw.cz>
	<CFF522B18982EA4481D3A3E23B83141C24B4DF@orsmsx407.jf.intel.com>
	<7F740D512C7C1046AB53446D3720017304B04F@scsmsx402.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031023141703.GG643@openzaurus.ucw.cz>
	<CFF522B18982EA4481D3A3E23B83141C24B4DF@orsmsx407.jf.intel.com>
	<7F740D512C7C1046AB53446D3720017304B04F@scsmsx402.sc.intel.com>
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
To: "Nakajima, Jun" <jun.nakajima@intel.com>, "Moore, Robert" <robert.moore@intel.com>, Pavel Machek <pavel@ucw.cz>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, linux-acpi <linux-acpi@intel.com>, cpufreq@www.linux.org.uk, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>

Vetoed.

cpufreq_dynamic is too generic, there are different approaches == different
governors in the work which are all "dynamic".

	Dominik

On Thu, Oct 23, 2003 at 02:50:06PM -0700, Nakajima, Jun wrote:
> Me too, because it would be consistent with the other ones; i.e. how the
> user perceives them.

On Thu, Oct 23, 2003 at 01:47:49PM -0700, Moore, Robert wrote:
> 
> I would vote for "cpufreq_dynamic"
> 
> Bob

On Thu, Oct 23, 2003 at 04:17:04PM +0200, Pavel Machek wrote:
> Could you name it cpufreq_demand? We have enough
> TLAs as is.
> 				Pavwl
