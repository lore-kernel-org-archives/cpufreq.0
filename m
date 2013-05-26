From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 2/3] arm: kirkwood: Instantiate cpufreq driver
Date: Sun, 26 May 2013 13:59:57 -0400
Message-ID: <20130526175957.GD31290@titan.lakedaemon.net>
References: <1359281244-31455-1-git-send-email-andrew@lunn.ch>
 <1359281244-31455-3-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1359281244-31455-3-git-send-email-andrew@lunn.ch>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: rjw@sisk.pl, jacmet@sunsite.dk, cpufreq@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, viresh.kumar@linaro.org

On Sun, Jan 27, 2013 at 11:07:23AM +0100, Andrew Lunn wrote:
> Register a platform driver structure for the cpufreq driver.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  arch/arm/Kconfig                                  |    1 +
>  arch/arm/mach-kirkwood/board-dt.c                 |    3 ++-
>  arch/arm/mach-kirkwood/common.c                   |   23 +++++++++++++++++++++
>  arch/arm/mach-kirkwood/common.h                   |    2 ++
>  arch/arm/mach-kirkwood/include/mach/bridge-regs.h |    2 ++
>  5 files changed, 30 insertions(+), 1 deletion(-)

Thanks again to Andrew for digging this one up.  Applied to mvebu/soc

thx,

Jason.
