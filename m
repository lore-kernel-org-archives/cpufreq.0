From: "Moore, Robert" <robert.moore@intel.com>
Subject: Implementation of fast-up algorithm in ondemand governor
Date: Wed, 5 Nov 2003 14:34:07 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <CFF522B18982EA4481D3A3E23B83141C24B53F@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>, cpufreq@www.linux.org.uk



Will this simple change implement the fast-up algorithm correctly?


-	if (idle_ticks < (DBS_RATE / 5))
-		cpufreq_driver_target(cpu_dbs_info[cpu].cur_policy,
-			cpu_dbs_info[cpu].cur_policy->cur + 1,=20
-			CPUFREQ_RELATION_L);

+	if (idle_ticks < (DBS_RATE / 5))
+		cpufreq_driver_target(cpu_dbs_info[cpu].cur_policy,
+			cpu_dbs_info[cpu].cur_policy->max,=20
+			CPUFREQ_RELATION_L);	=09
