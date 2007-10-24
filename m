From: Dave Jones <davej@redhat.com>
Subject: Re: [2.6 patch] #if 0 cpufreq.c:cpufreq_get()
Date: Wed, 24 Oct 2007 14:39:20 -0400
Message-ID: <20071024183920.GF14357@redhat.com>
References: <20071024162312.GH30533@stusta.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758927AbXJXSkF@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071024162312.GH30533@stusta.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Wed, Oct 24, 2007 at 06:23:12PM +0200, Adrian Bunk wrote:
 > cpufreq.c:cpufreq_get() no longer has any user.
 > 
 > Signed-off-by: Adrian Bunk <bunk@kernel.org>

ARM uses it.

drivers/pcmcia/sa11xx_base.c:   return sa1100_pcmcia_set_mecr(skt, cpufreq_get(0));
drivers/pcmcia/sa11xx_base.c:   unsigned int clock = cpufreq_get(0);
drivers/video/sa1100fb.c:               cpufreq_get(smp_processor_id()));
drivers/video/sa1100fb.c:       pcd = get_pcd(var->pixclock, cpufreq_get(0));

	Dave

-- 
http://www.codemonkey.org.uk
