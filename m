From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH][RFC] ondemand governor automatic downscaling
Date: Mon, 07 Mar 2005 01:53:41 +0100
Message-ID: <422BA615.1010708@tremplin-utc.net>
References: <88056F38E9E48644A0F562A38C64FB600426C6CF@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <88056F38E9E48644A0F562A38C64FB600426C6CF@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@zenii.linux.org.uk

Pallipadi, Venkatesh a =E9crit :
:
:
> In particular, this will not work well in the following situation:
> Assume a server with a constant read/write to disk. Say the CPU compute=
s
> something for 40% of time and then issues a I/O and waits for remaining
> 60% of time (until I/O is complete). This wait is irrespective of CPU
> speed. Now if we reduce the frequency to make CPU 70% busy, and CPU wil=
l
> still wait for IO and overall performance will go down as a result of
> the frequency slowdown.=20
> This can still happen with 20-80 policy, but the probablity is less.
Well, if I understand correctly, we lose time because the harddisk is=20
waiting for the CPU to do some computing before it can write anything=20
and the slowest is the CPU, the longer the harddisk will have to wait.=20
IMHO, this situation seems very unlikely because of all the I/O=20
virtualisation done by the kernel, including read-ahead and cache. The=20
harddisk will completely turn asynchronously, 100% of the time, while=20
the CPU will do computation during 70% of the time instead of 40%, still=20
having idle time. This shouldn't affect global performance. Still, I can=20
be overlooking something, do you have any testcase in mind?

In addition, in the very improbable case where disk would be waiting for=20
the CPU (half idle), the 20-80 policy would have slight superiority=20
simply because it is not as effective as the automatic downscaling=20
policy. It would be better to directly address this problem, for=20
instance, allowing the iowait time to count as busy time.


>=20
> I am thinking of two possiblities here:
> 1) Keep ondemand as it is, with a performance oriented frequency
> scaling. And add a new governor with this automatic downscaling and wit=
h
> other features making it a power oriented frequency scaling.
> 2) Change the ondemand governor itself with these changes.
>=20
> At present, I am tending towards option 1. But, I would like to get
> other opinions on this.
Well, I'd like to avoid as much as possible to have to fork the ondemand=20
governor so I'd like to try to stick to option 2 :-)

Eric
