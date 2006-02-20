From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Kernel Options for changing the settings of coservative govenor?
Date: Sun, 19 Feb 2006 17:11:00 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60074BD55E@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Cyrill Helg <helgc@ee.ethz.ch>, cpufreq@www.linux.org.uk


Just echo the value that you want into corresponding
/sys/devices/system/..../cpufreq/conservative/.. file in your init
script.=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Cyrill Helg
>Sent: Monday, February 13, 2006 1:26 AM
>To: cpufreq@www.linux.org.uk
>Subject: Kernel Options for changing the settings of=20
>coservative govenor?
>
>Hi guys
>
>I'm using the conservative govenor. But I think that the=20
>down_threshold is too=20
>low for my use. So I'd like to change that to 55 or so. How=20
>can I put that as=20
>a kernel Option? Because that would be the most elegant way of=20
>doing it.=20
>
>Thanks for any help!
>
>Cyrill
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
