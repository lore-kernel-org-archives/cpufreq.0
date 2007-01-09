From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: number of freq transitions on Athlon64 X2
Date: Mon, 8 Jan 2007 20:35:54 -0800
Message-ID: <EB12A50964762B4D8111D55B764A845401169E4E@scsmsx413.amr.corp.intel.com>
References: <45A2FB9C.3030206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <45A2FB9C.3030206@gmail.com>
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
To: Nebojsa Trpkovic <trxman@gmail.com>, cpufreq@lists.linux.org.uk



>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Nebojsa Trpkovic
>Sent: Monday, January 08, 2007 6:19 PM
>To: cpufreq@lists.linux.org.uk
>Subject: number of freq transitions on Athlon64 X2
>
>Hello,
>
>I've used Athlon64 for a long time and made a graph to monitor freq
>transitions on it.
>
>Lately, I have made a graph to monitor one Athlon64 3800+ X2 CPU and
>there were a lot more freq transitions even if poling time was=20
>two times
>longer.
>
>Is number of freq transitions on Athlon62 X2 calculated by suming
>transitions of both cores?
>

What does /sys/devices/system/cpu/cpu*/cpufreq/affected_cpus say?
If it has both the cores there, then the number of transitions in
Stats/* will be the summing the transitions from both cores.

-Venki
