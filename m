From: Toula Michael <keos@wanadoo.fr>
Subject: Re: /proc/sys/cpu interface and elanfreq on linux 2.4.20
Date: Wed, 17 Sep 2003 11:25:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F682891.6080600@wanadoo.fr>
References: <87znh4e0l2.fsf@wmipf.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <87znh4e0l2.fsf@wmipf.in-berlin.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Michael_Teichgr=E4ber?= <mt@wmipf.in-berlin.de>, cpufreq@www.linux.org.uk

Michael Teichgr=E4ber wrote:

>
>Am I missing something, does perhaps "deprecated interfaces" mean, the
>userspace access via /proc/sys/cpu might not work?
>
>
> =20
>
According to /usr/src/linux/Documentation/cpufreq/user-guide.txt :

"These are files (/proc/sys/cpu/0/* ) for deprecated interfaces to cpufre=
q, which offer far
less functionality."

Many functionality are missing (have a look on user-guide for more detail=
s) but the userspace stuff works.
In fact you just forgot to activate it. To do so (you must be root):
$ echo -n "0%0%100%userspace" > /proc/cpufreq

and then you should have
$ cat /proc/sys/cpu/0/*
66000
66000
1000

Now you can echo the frequency you want in /proc/sys/cpu/0/speed !
Enjoy !!!


Mike
