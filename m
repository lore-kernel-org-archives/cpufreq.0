From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 1/3] cpufreq / gx: Fix __init attribute locations
Date: Tue, 13 Aug 2013 15:19:40 +0200
Message-ID: <3142844.ubsh56jNy7@vostro.rjw.lan>
References: <1376389210-11470-1-git-send-email-hanjun.guo@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1376389210-11470-1-git-send-email-hanjun.guo@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hanjun Guo <hanjun.guo@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, linaro-acpi@lists.linaro.org

On Tuesday, August 13, 2013 06:20:08 PM Hanjun Guo wrote:
>  __init belongs after the return type on functions, not before it.
> 
> Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>

All 3 patches in the series queued up for 3.12.

Thanks,
Rafael


> ---
>  drivers/cpufreq/gx-suspmod.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/gx-suspmod.c b/drivers/cpufreq/gx-suspmod.c
> index 3dfc99b..e30fd16 100644
> --- a/drivers/cpufreq/gx-suspmod.c
> +++ b/drivers/cpufreq/gx-suspmod.c
> @@ -183,7 +183,7 @@ static void gx_write_byte(int reg, int value)
>   * gx_detect_chipset:
>   *
>   **/
> -static __init struct pci_dev *gx_detect_chipset(void)
> +static struct pci_dev * __init gx_detect_chipset(void)
>  {
>  	struct pci_dev *gx_pci = NULL;
>  
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
