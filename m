From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] [2.6.22] pasemi: cpufreq driver
Date: Fri, 27 Apr 2007 02:10:21 +0200
Message-ID: <f30b4e9138137515cafc0276d93812e0@kernel.crashing.org>
References: <20070425204633.GC19781@lixom.net>
	<200704261055.33739.arnd@arndb.de>
	<20070426164835.GA14149@lixom.net>
	<200704261911.22553.arnd@arndb.de>
	<c8fb6a47d8be41f856ab9cf19fc3814d@kernel.crashing.org>
	<20070426203802.GC17302@lixom.net>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20070426203802.GC17302@lixom.net>
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
Cc: linuxppc-dev@ozlabs.org, paulus@samba.org, egor@pasemi.com, Arnd Bergmann <arnd@arndb.de>, cpufreq@lists.linux.org.uk

>> You probably should map the SDC registers in the
>> platform startop code, and then have the various
>> platform drivers use that.  Maybe even do an
>> abstraction ;-)
>
> Yep, it's a good idea to do and I'll look at it for 2.6.23 time frame.

Oh I'm sure you can get that done in time for .22 still ;-)


Segher
