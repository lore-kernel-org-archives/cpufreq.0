From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] quieter speedstep-centrino
Date: Fri, 10 Dec 2004 09:15:02 +0100
Message-ID: <20041210081502.GB8989@dominikbrodowski.de>
References: <20041209172729.B3337@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041209172729.B3337@unix-os.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Thu, Dec 09, 2004 at 05:27:29PM -0800, Venkatesh Pallipadi wrote:
> 
> 
> Patch to remove speedstep-centrino error messages getting printed by default.
> Print them only when debug flags are enabled.
> 
> The reason for this patch is -
> With the multiple drivers model that we have now, any installation will try 
> different drivers one after the other, until one of them succeeds. So, 
> failure to add speedstep-centrino alone doesn't mean error, as some other
> driver (say acpi.ko) can succeed later and system will still be able to use
> speedstep. Printing the error whenever speedstep-centrino fails can confuse 
> the enduser.
> 
> Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Dominik Brodowski <linux@brodo.de>

Thanks,
	Dominik
