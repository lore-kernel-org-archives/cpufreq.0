From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Possible CPUFreq governor
Date: Wed, 27 Apr 2005 12:53:50 +0200
Message-ID: <20050427105350.GX2298@poupinou.org>
References: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <53866.130.127.49.120.1114558769.squirrel@130.127.49.120>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Bidewell <mark.bidewell@alumni.clemson.edu>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Tue, Apr 26, 2005 at 07:39:29PM -0400, Mark Bidewell wrote:
> I am attaching a Linux kernel patch which supplies a new CPUFreq governor
> for the CPUFreq interface.  It allows a user or daemon to reduce the
> thermal output of a mobile processor by reducing the frequency at which
> non-interactive processes are run.  It has been extensively tested on the
> 2.6.11.x kernels on a P4-M 3.2 GHz machine.

BTW how temperature is computed?

I dont see any difference (apart the fact that you are setting frequency
only for non-interactive processes) with the userspace governor.  If
really you have to get this feature, I think you should consider to
modify the userspace governor.


Some comments:

+unsigned compute_spd=0;
+struct cpufreq_policy  *cpupolicy;
+static char enabled=0;
+

I think cpupolicy should be declared static. Same for compute_spd.

...
+void scale_proc_freq(struct task_struct *t, int tsk_intr)
+{
+	if(!enabled) return;
          ^
       a space is missing.

+	if(!cpupolicy) return;
          ^
         ditto

also its likely you should write

	if (!cpupolicy)
		return;

(kernel coding style)

...

+#ifdef CONFIG_CPU_FREQ_GOV_TEMPSCALE_DBG
+	
+	struct task_param tasks[TRACK_NUM];
+	unsigned int curtask=0;

Why those indentations?

+	
+	void set_proc_stats(struct task_struct *t)
+	{
+		struct task_param *tsk = &tasks[curtask];
+		curtask = (curtask+1) % TRACK_NUM;
+		tsk->pid = t->pid;
+		tsk->speed = cpufreq_get(0);
+	}	
+	
+	static ssize_t show_tempscale_stats(struct cpufreq_policy *unused, char *buf){
+		int i;
+		int numtasks=curtask;
+		int sz=0;
                ^^^
You have to use a ssize_t here.

...

diff -Nur linux-2.6.11.6/include/linux/sched.h linux-sysfs/include/linux/sched.h
--- linux-2.6.11.6/include/linux/sched.h	2005-03-25 22:28:15.000000000 -0500
+++ linux-sysfs/include/linux/sched.h	2005-04-06 22:55:44.000000000 -0400
@@ -112,14 +112,12 @@
 #define EXIT_DEAD		32
 
 #define __set_task_state(tsk, state_value)		\
-	do { (tsk)->state = (state_value); } while (0)
-#define set_task_state(tsk, state_value)		\
-	set_mb((tsk)->state, (state_value))

Look a little bit more the macro you just removed here.
Its expected to return a value, namely 'state_value'.

But you are redefining those on other file latter as:

+/*Change by Mark Bidewell*/  <-- Why this comment?  Its useless.
+inline static void set_task_state(struct task_struct *tsk, unsigned state_value){
+	(tsk)->prev_state=(tsk)->state; set_mb((tsk)->state, (state_value));
+}

This is now an inlined function returning void.


+/*Change by Mark Bidewell*/
+inline static void set_current_state(unsigned state_value){		
+	current->prev_state=current->state; set_mb(current->state, (state_value));
+}

Ditto


Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
