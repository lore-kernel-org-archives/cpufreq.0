From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand question?
Date: Mon, 25 Oct 2004 09:58:48 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60032E52FD@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Nebojsa Trpkovic <trx@inbox.ru>, cpufreq@www.linux.org.uk



>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Nebojsa Trpkovic
>Sent: Sunday, October 24, 2004 12:11 PM
>To: cpufreq@www.linux.org.uk
>Subject: ondemand question?
>
>Can someone tell me how often "ondemand" governor can switch=20
>between CPU=20
>frequencies (How often does it poll CPU usage and decide what to do?)
>
>
>Thank you.
>

The frequency is not fixed. Default freq will depend on what amount of
time does CPU actually take to change the frequency. And user can change
this default value within some limits.

Once you start using ondemand governor you will find this (and other
ondemand tunables here)
/sys/devices/..../cpufreq/ondemand/sampling_rate
/sys/devices/..../cpufreq/ondemand/sampling_rate_max
/sys/devices/..../cpufreq/ondemand/sampling_rate_min
(all the numbers here are in uS)

Thanks,
Venki
