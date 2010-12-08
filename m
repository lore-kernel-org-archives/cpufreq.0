From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] cpufrequtils aperf: Fix MSR read on 32-bit
Date: Wed, 8 Dec 2010 21:53:45 +0100
Message-ID: <201012082153.46328.trenn@suse.de>
References: <1291826354.30060.34.camel@mendozza.osrc.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1291826354.30060.34.camel@mendozza.osrc.amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Frank Arnold <frank.arnold@amd.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Borislav Petkov <borislav.petkov@amd.com>, cpufreq@vger.kernel.org

On Wednesday 08 December 2010 17:39:14 Frank Arnold wrote:
> The cpufreq-aperf command does not work on 32-bit systems. The reason
> for that is a wrong count argument passed to the read() call. Instead
> of the buffer size, the size of the pointer to the buffer is used. On
> 64-bit systems this just happened to work, because we need to read an
> 8 byte value and a pointer has a size of 8 bytes on 64-bit. On 32-bit
> systems only 4 bytes are read, which then triggers the error path.
> 
> Signed-off-by: Frank Arnold <frank.arnold@amd.com>
> ---
>  utils/aperf.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/utils/aperf.c b/utils/aperf.c
> index 1c64501..6302f5a 100644
> --- a/utils/aperf.c
> +++ b/utils/aperf.c
> @@ -100,7 +100,7 @@ static int read_msr(int cpu, unsigned int idx, 
unsigned long long *val)
>  		return -1;
>  	if (lseek(fd, idx, SEEK_CUR) == -1)
>  		goto err;
> -	if (read(fd, val, sizeof val) != sizeof *val)
> +	if (read(fd, val, sizeof *val) != sizeof *val)

Reviewed-by: trenn@suse.de

Thanks,

       Thomas
