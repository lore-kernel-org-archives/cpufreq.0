From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] cpufreq: set policy->curfreq on initialization
Date: Fri, 15 Dec 2006 20:00:23 +0100
Message-ID: <20061215190023.GE5980@inferi.kami.home>
References: <20061213231653.GQ2418@redhat.com>
	<20061215185245.GD5980@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061215185245.GD5980@inferi.kami.home>
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
To: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Fri, Dec 15, 2006 at 07:52:45PM +0100, Mattia Dongili wrote:
> Check the correct variable and set policy->cur upon acpi-cpufreq
> initialization to allow the userspace governor to be used as default.
> 
> Signed-off-by: Mattia Dongili <malattia@linux.it>
> Acked-by: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
> Signed-off-by: Andrew Morton <akpm@osdl.org>

Oh, and this is currently in .20-mm1, Andrew pushed this patch to you
some days ago.

-- 
mattia
:wq!
