From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] [2.6.22] pasemi: cpufreq driver
Date: Thu, 26 Apr 2007 19:11:21 +0200
Message-ID: <200704261911.22553.arnd@arndb.de>
References: <20070425204633.GC19781@lixom.net>
	<200704261055.33739.arnd@arndb.de>
	<20070426164835.GA14149@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20070426164835.GA14149@lixom.net>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Olof Johansson <olof@lixom.net>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, cpufreq@lists.linux.org.uk

On Thursday 26 April 2007, Olof Johansson wrote:
> SDC is the system and debug controller, it contains a number of smaller
> devices such as the PIC, the PMU (Gizmo), RNG, and various debug
> features. Some already have drivers submitted, others will later on.

Oh well, these chips all seem to be the same. On cell, we have solved
the problem by introducing the 'cbe_regs' helper library that gives
access to all those miscellaneous registers to the individual device
drivers, so that not all of them need to scan the device tree for
the same registers and map them individually.

The problem with an of_platform_driver for this would be that you
can only have _one_ driver attached to the registers.

> Unfortunately the setting of the current active state is done to an SDC
> register, while information of the states is in the PMU, so access to
> both is needed in the driver.

One thing that you could do is to list only this one register of the
SDC in the reg property, not all of the SDC. 
 
	Arnd <><
