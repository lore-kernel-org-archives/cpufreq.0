From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] add missing __percpu markup in pcc-cpufreq.c
Date: Sat, 07 Aug 2010 21:35:27 +0200
Message-ID: <4C5DB57F.8070806@kernel.org>
References: <1281202643-26709-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1281202643-26709-1-git-send-email-namhyung@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Namhyung Kim <namhyung@gmail.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/07/2010 07:37 PM, Namhyung Kim wrote:
> pcc_cpu_info is a percpu pointer but was missing __percpu markup.
> Add it.
> 
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun
