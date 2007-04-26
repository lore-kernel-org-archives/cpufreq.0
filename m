From: olof@lixom.net (Olof Johansson)
Subject: Re: [PATCH] [2.6.22] pasemi: cpufreq driver
Date: Wed, 25 Apr 2007 20:57:16 -0500
Message-ID: <20070426015716.GA22598@lixom.net>
References: <20070425204633.GC19781@lixom.net>
	<200704260147.35878.arnd@arndb.de>
	<20070425235757.GA20905@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20070425235757.GA20905@lixom.net>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, cpufreq@lists.linux.org.uk

On Wed, Apr 25, 2007 at 06:57:57PM -0500, olof wrote:

> 2) See the idle loop interaction: It can go tristate once we have runtime
> selection of idle loop, but until then we need it for idle=doze.

Grmbl. Looks like I posted a stale patch that actually won't build with
PPC_PASEMI_CPUFREQ=n. I'll repost with the correct version.


-Olof
