From: Luigi Belli <lbelli@crema.unimi.it>
Subject: Re: Acer Aspire 1301XV (Athlon-XP Mobile 1500+) BIOS gives "broken"
	PST
Date: Sun, 21 Sep 2003 13:23:14 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200309211323.14834.lbelli@crema.unimi.it>
References: <32990.172.16.0.160.1064142492.squirrel@webmail.mosesonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <32990.172.16.0.160.1064142492.squirrel@webmail.mosesonline.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

On Sunday 21 September 2003 13:08, hmoser@mosesonline.com wrote:

> Detection of the correct frequ/power values on my laptop fails due to
> broken pst in the bios... so i decided to do an evil hack to the cpufreq
> source by hardcoding the pst for my cpu. the problem now is that i dont
> find information

I did the same thing some time ago, on a 1304LC (AXP 1800+). To find the=20
correct steps I used a system information tool called Sandra under Windows,=
=20
detecting the cpu speed under different load conditions.
If you want to take a look at my patch I can send it in your private email.

=2D-=20
"It is not enough to succeed.=A0=A0Others=A0must=A0fail."
Linux Registered User #301571, running Gentoo
Memeber of Luganega - Linux User Group Crema (IT)
http://filibusta.crema.unimi.it/
