From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 11:20:51 +0100
Message-ID: <4219B603.8050403@tremplin-utc.net>
References: <20050220131518.GB4495@inskipp> <4218B768.8020401@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040209020507000205090107"
In-Reply-To: <4218B768.8020401@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>, linux@dominikbrodowski.de

This is a multi-part message in MIME format.
--------------040209020507000205090107
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Eric Piel a =C3=A9crit :
> Alexander Clouter a =C3=A9crit :
>=20
>> Adds support to cpufreq_ondemand to ignore 'nice' cpu time
>>
> IMO, this policy should be has lightweight as possible. Why not making=20
> this feature just hard-coded? Don't count the load that nice'd tasks do=
,=20
> period!
>=20
> It would make the patch 5 lines instead of 50. Every userspace deamon=20
> have this feature enabled by default, so this is a very reasonable=20
> trade-off.
>=20
Here is the patch, it does exactly the same functionality but it's=20
completly static and therefore much smaller. Just tested on my computer,=20
it does the trick.

Eric
--
Avoid the cpufreq ondemand governor to count the nice'd tasks as load=20
for the cpu.

  cpufreq_ondemand.c |   17 ++++++++++-------
  1 files changed, 10 insertions(+), 7 deletions(-)

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------040209020507000205090107
Content-Type: text/x-patch;
 name="ondemand-ignore-nice-static.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ondemand-ignore-nice-static.patch"

--- linux-2.6.11-rc4/drivers/cpufreq/cpufreq_ondemand.c.bak	2005-02-06 23:35:41.000000000 +0100
+++ linux-2.6.11-rc4/drivers/cpufreq/cpufreq_ondemand.c	2005-02-21 11:10:26.000000000 +0100
@@ -253,7 +253,8 @@ static void dbs_check_cpu(int cpu)
 
 	/* Check for frequency increase */
 	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
+		kstat_cpu(cpu).cpustat.iowait +
+		kstat_cpu(cpu).cpustat.nice;
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_up;
 	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
@@ -269,7 +270,8 @@ static void dbs_check_cpu(int cpu)
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
 		total_idle_ticks = kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait;
+			kstat_cpu(j).cpustat.iowait +
+			kstat_cpu(j).cpustat.nice;
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_up;
 		j_dbs_info->prev_cpu_idle_up = total_idle_ticks;
@@ -297,7 +299,8 @@ static void dbs_check_cpu(int cpu)
 		return;
 
 	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
+		kstat_cpu(cpu).cpustat.iowait +
+		kstat_cpu(cpu).cpustat.nice;
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_down;
 	this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -312,7 +315,8 @@ static void dbs_check_cpu(int cpu)
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
 		total_idle_ticks = kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait;
+			kstat_cpu(j).cpustat.iowait +
+			kstat_cpu(j).cpustat.nice;
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_down;
 		j_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -398,11 +402,10 @@ static int cpufreq_governor_dbs(struct c
 			j_dbs_info->cur_policy = policy;
 		
 			j_dbs_info->prev_cpu_idle_up = 
-				kstat_cpu(j).cpustat.idle +
-				kstat_cpu(j).cpustat.iowait;
 			j_dbs_info->prev_cpu_idle_down = 
 				kstat_cpu(j).cpustat.idle +
-				kstat_cpu(j).cpustat.iowait;
+				kstat_cpu(j).cpustat.iowait +
+				kstat_cpu(j).cpustat.nice;
 		}
 		this_dbs_info->enable = 1;
 		sysfs_create_group(&policy->kobj, &dbs_attr_group);

--------------040209020507000205090107
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040209020507000205090107--

