From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] acpi-cpufreq: add missing __percpu markup
Date: Fri, 13 Aug 2010 16:03:40 +0200
Message-ID: <4C6550BC.9010006@kernel.org>
References: <1281708011-26583-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1281708011-26583-1-git-send-email-namhyung@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Namhyung Kim <namhyung@gmail.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/13/2010 04:00 PM, Namhyung Kim wrote:
> acpi_perf_data is a percpu pointer but was missing __percpu markup.
> Add it.
> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
