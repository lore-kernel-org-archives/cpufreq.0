From: bugme-daemon@osdl.org
Subject: [Bug 3255] New: longhaul: FSB incorrectly guessed (CL-6000E)
Date: Sat, 21 Aug 2004 05:42:00 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408211242.i7LCg0Kb029475@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3255

           Summary: longhaul: FSB incorrectly guessed (CL-6000E)
    Kernel Version: 2.6.8.1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: Nomad@kotnet.org


VIA CL-6000E

cpu family : 6 
model : 7 
model name : VIA Samuel 2 
stepping : 3

No matching FSB is found, and thus is set to 0, for which the modules offers no 
longhaul. 

solutions:

line 252 of longhaul.c:

if (c->x86_model==6) 

should be: 

if (c->x86_model>=6)

This fixes the problem for me. But more general: the problem is that the 
rounding scheme used does not always work. The cpu-speed (/proc/cpuinfo): 601.
489 is a bit high (on most CL-6000E it is) and causes the problem. A more 
general solution is to check if the speed lies within 5% of the guessed value 
(something like the following):

#define ROUNDING 5 

static int _guess(int guess) 
{ 
  int target; 

  target = ((maxmult/10)*guess); 
  if (maxmult%10 != 0) 
  target += (guess/2); 

  return target; 
} 


static int guess_fsb(void) 
{ 
  int speed = (cpu_khz/1000); 
  int i, diff; 
  int speeds[3] = { 66, 100, 133 }; 

  /* find fsb with ROUNDING procent margin */ 
  for (i=0; i<3; i++) { 
    diff = _guess(speeds) - speed; 
    if(diff < 0) diff = -diff; 
    if(diff < speed*ROUNDING/100) return speeds; 
  } 

  /* module will fail to initalize */ 
  return 0; 
}

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
